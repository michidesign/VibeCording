/**
 * リシテア勤怠ヘルパー - Content Script
 * リシテアの稼働セクションにデータを自動入力
 */

// メッセージリスナー
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
    if (request.action === 'fillWorkData') {
        const result = fillWorkData(request.data);
        sendResponse(result);
    } else if (request.action === 'getCurrentDate') {
        const result = getCurrentDate();
        sendResponse(result);
    }
    return true; // 非同期レスポンスを許可
});

/**
 * リシテア画面から現在の日付を取得
 */
function getCurrentDate() {
    try {
        // mod-daily-control 内の date 要素から日付を取得
        const dateDiv = document.querySelector('.mod-daily-control .date');
        if (!dateDiv) {
            return { success: false, message: '日付が見つかりません' };
        }

        // 年、月、日を取得
        const yearSpan = dateDiv.querySelector('.year');
        const spans = dateDiv.querySelectorAll('span:not(.year):not(.sla):not(.divider):not(.kakko)');

        let year = '';
        let month = '';
        let day = '';

        if (yearSpan) {
            year = yearSpan.textContent.trim();
        }

        // 月と日を取得（sla, divider, kakko以外のspan）
        const values = [];
        spans.forEach(span => {
            const text = span.textContent.trim();
            if (text && !isNaN(text)) {
                values.push(text);
            }
        });

        if (values.length >= 2) {
            month = values[0].padStart(2, '0');
            day = values[1].padStart(2, '0');
        }

        if (year && month && day) {
            return {
                success: true,
                date: `${year}/${month}/${day}`,
                year: year,
                month: month,
                day: day
            };
        }

        return { success: false, message: '日付の解析に失敗しました' };
    } catch (error) {
        console.error('日付取得エラー:', error);
        return { success: false, message: error.message };
    }
}

/**
 * 稼働データをリシテアに入力
 */
function fillWorkData(data) {
    try {
        // 稼働セクションの行を取得
        // CostNoSelect という name を持つ select 要素を探す
        const costSelects = document.querySelectorAll('select[name="CostNoSelect"]');

        if (costSelects.length === 0) {
            return { success: false, message: '稼働セクションが見つかりません。リシテアの勤怠入力画面を開いてください。' };
        }

        let filledCount = 0;
        const maxRows = Math.min(data.length, costSelects.length);

        for (let i = 0; i < maxRows; i++) {
            const rowData = data[i];
            const row = findRowElements(costSelects[i]);

            if (!row) continue;

            // JOBコードを選択
            if (rowData.jobCode) {
                selectJobCode(row.costSelect, rowData.jobCode);
            }

            // 作業開始時間
            if (rowData.startTime && row.startTime) {
                setInputValue(row.startTime, rowData.startTime);
            }

            // 作業終了時間
            if (rowData.endTime && row.endTime) {
                setInputValue(row.endTime, rowData.endTime);
            }

            // 作業時間
            if (rowData.workTime && row.workTime) {
                setInputValue(row.workTime, rowData.workTime);
            }

            // フリーコメント
            if (rowData.comment && row.comment) {
                setInputValue(row.comment, rowData.comment);
            }

            filledCount++;
        }

        if (filledCount === 0) {
            return { success: false, message: 'データを入力できませんでした' };
        }

        return {
            success: true,
            filledCount: filledCount,
            message: `${filledCount}件のデータを入力しました`
        };

    } catch (error) {
        console.error('リシテアヘルパー エラー:', error);
        return { success: false, message: error.message };
    }
}

/**
 * 行の入力要素を取得
 */
function findRowElements(costSelect) {
    // CostNoSelect を基準に同じ行（tr）内の要素を探す
    const tr = costSelect.closest('tr');
    if (!tr) return null;

    // 同じ行内の入力要素を取得
    const inputs = tr.querySelectorAll('input[type="text"]');

    // 入力フィールドのname属性で特定
    let startTime = null;
    let endTime = null;
    let workTime = null;
    let comment = null;

    inputs.forEach(input => {
        const name = input.name;
        if (name === 'CostStartTime') {
            startTime = input;
        } else if (name === 'CostEndTime') {
            endTime = input;
        } else if (name === 'CostQuantity') {
            workTime = input;
        } else if (name === 'FreeComment') {
            comment = input;
        }
    });

    return {
        costSelect: costSelect,
        startTime: startTime,
        endTime: endTime,
        workTime: workTime,
        comment: comment
    };
}

/**
 * JOBコードをセレクトボックスで選択
 */
function selectJobCode(selectElement, jobCode) {
    if (!selectElement || !jobCode) return;

    // Excelの値から番号部分を抽出
    // 形式: "0000000000:名称" または "0000000000"
    let searchCode = jobCode.split(':')[0].trim();

    // オプションを検索
    const options = selectElement.options;
    let found = false;

    for (let i = 0; i < options.length; i++) {
        const optionText = options[i].textContent.trim();
        const optionValue = options[i].value;

        // オプションのテキストから番号部分を抽出して比較
        const optionCode = optionText.split(':')[0].trim();

        if (optionCode === searchCode) {
            selectElement.selectedIndex = i;
            found = true;
            break;
        }
    }

    if (found) {
        // 変更イベントを発火
        triggerEvent(selectElement, 'change');
    } else {
        console.warn(`JOBコードが見つかりません: ${jobCode}`);
    }
}

/**
 * 入力フィールドに値をセット
 */
function setInputValue(inputElement, value) {
    if (!inputElement) return;

    inputElement.value = value;

    // イベントを発火してリシテアの検証ロジックを実行
    triggerEvent(inputElement, 'input');
    triggerEvent(inputElement, 'change');
    triggerEvent(inputElement, 'blur');
}

/**
 * イベントを発火
 */
function triggerEvent(element, eventType) {
    const event = new Event(eventType, { bubbles: true, cancelable: true });
    element.dispatchEvent(event);
}

// ページ読み込み完了時にログ
console.log('リシテア勤怠ヘルパー: Content Script が読み込まれました');
