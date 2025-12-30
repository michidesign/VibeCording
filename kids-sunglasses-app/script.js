// DOM Elements
const photoUpload = document.getElementById('photoUpload');
const sunglassesUpload = document.getElementById('sunglassesUpload');
const sunglassesPreview = document.getElementById('sunglassesPreview');
const resetSunglassesBtn = document.getElementById('resetSunglassesBtn');
const dropZone = document.getElementById('dropZone');
const previewContainer = document.getElementById('previewContainer');
const placeholder = document.getElementById('placeholder');
const loading = document.getElementById('loading');
const loadingText = document.getElementById('loadingText');
const downloadBtn = document.getElementById('downloadBtn');
const carouselControls = document.getElementById('carouselControls');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const slideCounter = document.getElementById('slideCounter');
const thumbnailContainer = document.getElementById('thumbnailContainer');

// State
let sunglassesImg = new Image();
let sunglassesLoaded = false;
let processedImages = [];
let currentSlideIndex = 0;
let previousSlideIndex = -1;
let mainPreviewImg = null;
let thumbnailImages = [];
let cachedImageObjects = []; // 事前読み込み済み画像オブジェクト
const defaultSunglassesPath = 'default-sunglasses.png';

// Initialize sunglasses image
function loadSunglassesImage(src, useCors = false) {
    return new Promise((resolve) => {
        const img = new Image();
        if (useCors) {
            img.crossOrigin = 'anonymous';
        }
        img.onload = () => {
            sunglassesImg = img;
            sunglassesLoaded = true;
            console.log('Sunglasses image loaded:', src.substring(0, 50));
            resolve(true);
        };
        img.onerror = () => {
            console.warn('Failed to load sunglasses image:', src.substring(0, 50));
            resolve(false);
        };
        img.src = src;
    });
}

// Try loading sunglasses image
async function initSunglassesImage() {
    // Try PNG without CORS first (works for local file://)
    let loaded = await loadSunglassesImage(defaultSunglassesPath, false);

    // Try with CORS if local failed
    if (!loaded) {
        console.log('Trying with CORS...');
        loaded = await loadSunglassesImage(defaultSunglassesPath, true);
    }

    if (loaded && sunglassesPreview) {
        sunglassesPreview.src = defaultSunglassesPath;
    }

    console.log('Sunglasses loaded:', sunglassesLoaded);
}

initSunglassesImage();

// Load face-api.js models
const MODEL_URL = 'https://justadudewhohacks.github.io/face-api.js/models';
let modelsLoaded = false;

// UI status element
const modelStatus = document.getElementById('modelStatus');

function updateStatus(message, type) {
    if (modelStatus) {
        modelStatus.textContent = message;
        modelStatus.className = `status ${type}`;
    }
}

// Main model loading function
console.log('Starting to load face detection models...');
updateStatus('AIモデル読み込み中...', 'loading');

async function loadModels() {
    try {
        console.log('Loading TinyFaceDetector...');
        await faceapi.nets.tinyFaceDetector.loadFromUri(MODEL_URL);
        console.log('TinyFaceDetector loaded');

        console.log('Loading FaceLandmark68Net...');
        await faceapi.nets.faceLandmark68Net.loadFromUri(MODEL_URL);
        console.log('FaceLandmark68Net loaded');

        modelsLoaded = true;
        console.log('All face detection models loaded successfully!');
        updateStatus('準備完了', 'ready');
    } catch (err) {
        console.error('Error loading models:', err);
        updateStatus('モデル読み込みエラー', 'error');

        const isFileProtocol = window.location.protocol === 'file:';
        if (isFileProtocol) {
            alert('ローカルファイルとして開いているため、AIモデルを読み込めません。\n\nstart-server.command をダブルクリックして起動してください。');
        } else {
            alert('モデルの読み込みに失敗しました。インターネット接続を確認してください。');
        }
    }
}

loadModels();

// Sunglasses Upload
sunglassesUpload.addEventListener('change', (e) => {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (event) => {
            const newImg = new Image();
            newImg.onload = () => {
                sunglassesImg = newImg;
                sunglassesLoaded = true;
                sunglassesPreview.src = event.target.result;
                resetSunglassesBtn.classList.remove('hidden');
            };
            newImg.src = event.target.result;
        };
        reader.readAsDataURL(file);
    }
});

// Reset to default sunglasses
resetSunglassesBtn.addEventListener('click', () => {
    sunglassesImg = new Image();
    sunglassesImg.crossOrigin = 'anonymous';
    sunglassesImg.src = defaultSunglassesPath;
    sunglassesImg.onload = () => {
        sunglassesLoaded = true;
    };
    sunglassesPreview.src = defaultSunglassesPath;
    resetSunglassesBtn.classList.add('hidden');
});

// Drag and Drop
['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropZone.addEventListener(eventName, preventDefaults, false);
    document.body.addEventListener(eventName, preventDefaults, false);
});

function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
}

['dragenter', 'dragover'].forEach(eventName => {
    dropZone.addEventListener(eventName, () => {
        dropZone.classList.add('drag-over');
    }, false);
});

['dragleave', 'drop'].forEach(eventName => {
    dropZone.addEventListener(eventName, () => {
        dropZone.classList.remove('drag-over');
    }, false);
});

dropZone.addEventListener('drop', (e) => {
    const files = e.dataTransfer.files;
    handleFiles(files);
}, false);

// Click to upload
dropZone.addEventListener('click', (e) => {
    if (e.target.tagName !== 'LABEL' && e.target.tagName !== 'INPUT') {
        photoUpload.click();
    }
});

photoUpload.addEventListener('change', (e) => {
    handleFiles(e.target.files);
});

// Handle uploaded files
async function handleFiles(files) {
    if (files.length === 0) return;

    // Reset state
    processedImages = [];
    currentSlideIndex = 0;
    downloadBtn.disabled = true;
    placeholder.classList.add('hidden');
    loading.classList.remove('hidden');
    carouselControls.classList.add('hidden');
    thumbnailContainer.classList.add('hidden');
    thumbnailContainer.innerHTML = '';

    // Clear previous images
    const existingImages = previewContainer.querySelectorAll('img');
    existingImages.forEach(img => img.remove());

    const totalFiles = files.length;

    for (let i = 0; i < totalFiles; i++) {
        const file = files[i];
        if (!file.type.startsWith('image/')) continue;

        updateLoadingText(`処理中... ${i + 1} / ${totalFiles}`);

        try {
            const result = await processImage(file);
            if (result) {
                processedImages.push(result);
            }
        } catch (err) {
            console.error(`Error processing ${file.name}:`, err);
        }
    }

    loading.classList.add('hidden');

    if (processedImages.length > 0) {
        downloadBtn.disabled = false;
        renderPreviews();

        if (processedImages.length > 1) {
            downloadBtn.textContent = `まとめてダウンロード (${processedImages.length}枚)`;
        } else {
            downloadBtn.textContent = '画像をダウンロード';
        }
    } else {
        placeholder.classList.remove('hidden');
        placeholder.innerHTML = '<p>顔が検出されませんでした。<br>別の写真をお試しください。</p>';
    }
}

function updateLoadingText(text) {
    loadingText.textContent = text;
}

// Process single image
async function processImage(file) {
    // Wait for models to load
    if (!modelsLoaded) {
        console.log('Waiting for models to load...');
        await new Promise((resolve, reject) => {
            const checkInterval = setInterval(() => {
                if (modelsLoaded) {
                    clearInterval(checkInterval);
                    resolve();
                }
            }, 100);
            setTimeout(() => {
                clearInterval(checkInterval);
                reject(new Error('Models load timeout'));
            }, 30000);
        });
    }

    // Wait for sunglasses to load (but don't fail if not loaded)
    if (!sunglassesLoaded) {
        console.log('Waiting for sunglasses image...');
        await new Promise((resolve) => {
            const checkInterval = setInterval(() => {
                if (sunglassesLoaded) {
                    clearInterval(checkInterval);
                    resolve();
                }
            }, 100);
            setTimeout(() => {
                clearInterval(checkInterval);
                console.warn('Sunglasses image timeout, continuing anyway...');
                resolve();
            }, 3000);
        });
    }

    // Get original filename
    let originalFileName = file.name;
    const lastDotIndex = originalFileName.lastIndexOf('.');
    if (lastDotIndex !== -1) {
        originalFileName = originalFileName.substring(0, lastDotIndex);
    }

    // Create image from file
    const img = await faceapi.bufferToImage(file);
    console.log(`Processing image: ${img.width} x ${img.height}`);

    // For very large images, resize first for detection
    let detectionImg = img;
    let scale = 1;
    const MAX_DETECTION_SIZE = 1200;

    if (img.width > MAX_DETECTION_SIZE || img.height > MAX_DETECTION_SIZE) {
        scale = MAX_DETECTION_SIZE / Math.max(img.width, img.height);
        const resizedCanvas = document.createElement('canvas');
        resizedCanvas.width = Math.round(img.width * scale);
        resizedCanvas.height = Math.round(img.height * scale);
        const resizedCtx = resizedCanvas.getContext('2d');
        resizedCtx.drawImage(img, 0, 0, resizedCanvas.width, resizedCanvas.height);
        detectionImg = resizedCanvas;
        console.log(`Resized for detection: ${resizedCanvas.width} x ${resizedCanvas.height} (scale: ${scale.toFixed(3)})`);
    }

    // Create output canvas at original size
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0);

    try {
        let detections = [];

        // Use TinyFaceDetector (embedded model)
        console.log('Detecting faces with TinyFaceDetector...');
        try {
            const tinyOptions = new faceapi.TinyFaceDetectorOptions({
                inputSize: 512,
                scoreThreshold: 0.2
            });
            detections = await faceapi
                .detectAllFaces(detectionImg, tinyOptions)
                .withFaceLandmarks();
            console.log(`TinyFaceDetector found ${detections.length} face(s)`);
        } catch (e) {
            console.error('TinyFaceDetector error:', e);
        }

        if (detections.length === 0) {
            console.warn(`No faces detected in ${file.name}`);
            return null;
        }

        // Draw sunglasses for each face (scale landmarks back if needed)
        detections.forEach((detection, index) => {
            console.log(`Drawing sunglasses on face ${index + 1}`);
            const landmarks = detection.landmarks;

            // Scale landmarks back to original image size
            if (scale !== 1) {
                const scaledPositions = landmarks.positions.map(p => ({
                    x: p.x / scale,
                    y: p.y / scale
                }));
                drawSunglassesFromPositions(ctx, scaledPositions);
            } else {
                drawSunglasses(ctx, landmarks);
            }
        });

        // Convert to Blob for faster display
        const dataURL = canvas.toDataURL('image/png');
        const blobURL = await dataURLtoBlobURL(dataURL);

        return {
            filename: `${originalFileName}_sunglasses.png`,
            dataURL: dataURL,
            blobURL: blobURL
        };

    } catch (error) {
        console.error('Error during processing:', error);
        return null;
    }
}

// Draw sunglasses using raw positions array (for scaled landmarks)
function drawSunglassesFromPositions(ctx, positions) {
    // 68-point landmark indices:
    // Left eye: 36-41, Right eye: 42-47
    // Nose: 27-35, Jaw: 0-16

    const leftEye = positions.slice(36, 42);
    const rightEye = positions.slice(42, 48);
    const nose = positions.slice(27, 36);
    const jaw = positions.slice(0, 17);

    const leftEyeCenter = getCenter(leftEye);
    const rightEyeCenter = getCenter(rightEye);

    const dy = rightEyeCenter.y - leftEyeCenter.y;
    const dx = rightEyeCenter.x - leftEyeCenter.x;
    const angle = Math.atan2(dy, dx);
    const eyeDistance = Math.sqrt(dx * dx + dy * dy);

    const noseBridge = nose[0];
    const leftFaceEdge = jaw[0];
    const rightFaceEdge = jaw[16];
    const faceWidth = Math.abs(rightFaceEdge.x - leftFaceEdge.x);
    const noseToLeft = Math.abs(noseBridge.x - leftFaceEdge.x);

    const yawRatio = noseToLeft / faceWidth;
    const yaw = (yawRatio - 0.5) * 2;

    const widthMultiplier = 2.2;
    let glassesWidth = eyeDistance * widthMultiplier;
    const glassesHeight = glassesWidth * (sunglassesImg.height / sunglassesImg.width);

    const yawCos = Math.cos(Math.abs(yaw) * Math.PI * 0.4);
    glassesWidth *= yawCos;

    const eyeMidpointX = (leftEyeCenter.x + rightEyeCenter.x) / 2;
    const centerX = noseBridge.x * 0.7 + eyeMidpointX * 0.3;
    const centerY = (leftEyeCenter.y + rightEyeCenter.y) / 2 + (glassesHeight * 0.15);

    const skewAmount = yaw * 0.3;

    ctx.save();
    ctx.translate(centerX, centerY);
    ctx.rotate(angle);

    const scaleX = 1;
    const skewY = skewAmount * 0.5;
    ctx.transform(scaleX, skewY, 0, 1, 0, 0);

    ctx.imageSmoothingEnabled = true;
    ctx.imageSmoothingQuality = 'high';

    const yOffset = Math.abs(yaw) * glassesHeight * 0.05;

    ctx.drawImage(
        sunglassesImg,
        -glassesWidth / 2,
        -glassesHeight / 2 + yOffset,
        glassesWidth,
        glassesHeight
    );

    ctx.restore();
}

// Draw sunglasses on face with perspective correction
function drawSunglasses(ctx, landmarks) {
    const leftEye = landmarks.getLeftEye();
    const rightEye = landmarks.getRightEye();
    const nose = landmarks.getNose();
    const jaw = landmarks.getJawOutline();

    // Calculate eye centers
    const leftEyeCenter = getCenter(leftEye);
    const rightEyeCenter = getCenter(rightEye);

    // Calculate angle (roll)
    const dy = rightEyeCenter.y - leftEyeCenter.y;
    const dx = rightEyeCenter.x - leftEyeCenter.x;
    const angle = Math.atan2(dy, dx);

    // Calculate eye distance
    const eyeDistance = Math.sqrt(dx * dx + dy * dy);

    // Get nose bridge point for better positioning
    const noseBridge = nose[0];

    // Calculate Yaw (left-right head rotation)
    // Use the ratio of nose position relative to face edges
    const leftFaceEdge = jaw[0];
    const rightFaceEdge = jaw[16];
    const faceWidth = Math.abs(rightFaceEdge.x - leftFaceEdge.x);
    const noseToLeft = Math.abs(noseBridge.x - leftFaceEdge.x);
    const noseToRight = Math.abs(rightFaceEdge.x - noseBridge.x);

    // Yaw ratio: 0.5 = facing forward, <0.5 = facing right, >0.5 = facing left
    const yawRatio = noseToLeft / faceWidth;
    // Convert to -1 to 1 range (negative = facing right, positive = facing left)
    const yaw = (yawRatio - 0.5) * 2;

    // Calculate sunglasses size with perspective adjustment
    const widthMultiplier = 2.2;
    let glassesWidth = eyeDistance * widthMultiplier;
    const glassesHeight = glassesWidth * (sunglassesImg.height / sunglassesImg.width);

    // Adjust width based on yaw (perspective foreshortening)
    // When face turns, the apparent width decreases
    const yawCos = Math.cos(Math.abs(yaw) * Math.PI * 0.4); // Max 40% perspective
    glassesWidth *= yawCos;

    // Calculate center position
    const eyeMidpointX = (leftEyeCenter.x + rightEyeCenter.x) / 2;
    const centerX = noseBridge.x * 0.7 + eyeMidpointX * 0.3;
    const centerY = (leftEyeCenter.y + rightEyeCenter.y) / 2 + (glassesHeight * 0.15);

    // Calculate skew for perspective effect
    // When looking right (yaw < 0): left side appears larger
    // When looking left (yaw > 0): right side appears larger
    const skewAmount = yaw * 0.3; // Adjust intensity

    // Draw with perspective transformation
    ctx.save();
    ctx.translate(centerX, centerY);
    ctx.rotate(angle);

    // Apply skew transformation for yaw perspective
    // transform(a, b, c, d, e, f)
    // a: horizontal scale, b: vertical skew, c: horizontal skew, d: vertical scale
    const scaleX = 1;
    const skewY = skewAmount * 0.5; // Vertical skew based on yaw
    ctx.transform(scaleX, skewY, 0, 1, 0, 0);

    // High quality rendering
    ctx.imageSmoothingEnabled = true;
    ctx.imageSmoothingQuality = 'high';

    // Adjust vertical position slightly based on yaw for more natural look
    const yOffset = Math.abs(yaw) * glassesHeight * 0.05;

    ctx.drawImage(
        sunglassesImg,
        -glassesWidth / 2,
        -glassesHeight / 2 + yOffset,
        glassesWidth,
        glassesHeight
    );

    ctx.restore();
}

// Calculate center of points
function getCenter(points) {
    const x = points.reduce((sum, p) => sum + p.x, 0) / points.length;
    const y = points.reduce((sum, p) => sum + p.y, 0) / points.length;
    return { x, y };
}

// Convert dataURL to Blob URL for faster rendering
function dataURLtoBlobURL(dataURL) {
    return new Promise((resolve) => {
        const byteString = atob(dataURL.split(',')[1]);
        const mimeType = dataURL.split(',')[0].split(':')[1].split(';')[0];
        const ab = new ArrayBuffer(byteString.length);
        const ia = new Uint8Array(ab);
        for (let i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        const blob = new Blob([ab], { type: mimeType });
        resolve(URL.createObjectURL(blob));
    });
}

// Render previews
function renderPreviews() {
    // Clear existing
    const existingImages = previewContainer.querySelectorAll('img');
    existingImages.forEach(img => img.remove());
    thumbnailContainer.innerHTML = '';

    // Reset cached arrays
    mainPreviewImg = null;
    thumbnailImages = [];
    cachedImageObjects = [];
    previousSlideIndex = -1;

    placeholder.classList.add('hidden');

    // Show carousel controls if multiple images
    if (processedImages.length > 1) {
        carouselControls.classList.remove('hidden');
        thumbnailContainer.classList.remove('hidden');
    }

    // 全画像を事前にImageオブジェクトとしてキャッシュ（即座切り替え用）
    processedImages.forEach((imgData) => {
        const cachedImg = new Image();
        cachedImg.src = imgData.blobURL;
        cachedImageObjects.push(cachedImg);
    });

    // Create single main preview image (src will be switched)
    mainPreviewImg = document.createElement('img');
    mainPreviewImg.src = processedImages[0].blobURL;
    mainPreviewImg.alt = processedImages[0].filename;
    mainPreviewImg.classList.add('active');
    previewContainer.appendChild(mainPreviewImg);

    // Create thumbnails (use blobURL for faster loading)
    processedImages.forEach((imgData, index) => {
        const thumb = document.createElement('img');
        thumb.src = imgData.blobURL;
        thumb.alt = `Thumbnail ${index + 1}`;
        if (index === 0) {
            thumb.classList.add('active');
        }
        thumb.addEventListener('click', () => {
            goToSlide(index);
        });
        thumbnailContainer.appendChild(thumb);
        thumbnailImages.push(thumb);
    });

    previousSlideIndex = 0;
    slideCounter.textContent = `1 / ${processedImages.length}`;
}

// Fast slide navigation (optimized)
function goToSlide(index) {
    if (index === currentSlideIndex) return;
    currentSlideIndex = index;
    updateCarousel();
}

// Update carousel display (超高速版 - キャッシュ済み画像を使用)
function updateCarousel() {
    // キャッシュ済み画像のsrcを使用（既に読み込み済みなので即座に表示）
    if (mainPreviewImg && cachedImageObjects[currentSlideIndex]) {
        // 既にキャッシュされた画像からsrcをコピー（再読み込みなし）
        mainPreviewImg.src = cachedImageObjects[currentSlideIndex].src;
        mainPreviewImg.alt = processedImages[currentSlideIndex].filename;
    }

    // Update thumbnail active state（クラス操作のみ - 高速）
    if (previousSlideIndex >= 0 && previousSlideIndex < thumbnailImages.length) {
        thumbnailImages[previousSlideIndex].classList.remove('active');
    }
    if (currentSlideIndex >= 0 && currentSlideIndex < thumbnailImages.length) {
        thumbnailImages[currentSlideIndex].classList.add('active');
    }

    // Update counter
    slideCounter.textContent = `${currentSlideIndex + 1} / ${processedImages.length}`;

    // Update previous index
    previousSlideIndex = currentSlideIndex;
}

// Carousel navigation
prevBtn.addEventListener('click', () => {
    if (currentSlideIndex > 0) {
        currentSlideIndex--;
        updateCarousel();
    }
});

nextBtn.addEventListener('click', () => {
    if (currentSlideIndex < processedImages.length - 1) {
        currentSlideIndex++;
        updateCarousel();
    }
});

// Download
downloadBtn.addEventListener('click', () => {
    if (processedImages.length === 0) return;

    if (processedImages.length === 1) {
        // Single file download
        const image = processedImages[0];
        const link = document.createElement('a');
        link.download = image.filename;
        link.href = image.dataURL;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    } else {
        // ZIP download
        const zip = new JSZip();

        processedImages.forEach(img => {
            const base64Data = img.dataURL.split(',')[1];
            zip.file(img.filename, base64Data, { base64: true });
        });

        zip.generateAsync({ type: 'blob' })
            .then(content => {
                const link = document.createElement('a');
                link.download = 'sunglasses_photos.zip';
                link.href = URL.createObjectURL(content);
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
                URL.revokeObjectURL(link.href);
            });
    }
});
