const imageUpload = document.getElementById('imageUpload');
const uploadSection = document.querySelector('.upload-section');
const previewContainer = document.getElementById('previewContainer');
const loading = document.getElementById('loading');
const placeholder = document.getElementById('placeholder');
const controls = document.getElementById('controls');
const downloadBtn = document.getElementById('downloadBtn');
const carouselControls = document.getElementById('carouselControls');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const slideCounter = document.getElementById('slideCounter');

let sunglassesImg = new Image();
let processedImages = []; // Array to store { filename: string, dataURL: string }
let currentSlideIndex = 0;

// Use the base64 string from sunglasses_data.js
if (typeof sunglassesBase64 !== 'undefined') {
    sunglassesImg.src = sunglassesBase64;
} else {
    console.error("sunglassesBase64 is not defined. Fallback to file.");
    sunglassesImg.src = 'sunglasses.png';
}

// Ensure sunglasses image is loaded
let sunglassesLoaded = false;
sunglassesImg.onload = () => {
    sunglassesLoaded = true;
    console.log("Sunglasses image loaded");
};

// Load models
Promise.all([
    faceapi.nets.tinyFaceDetector.loadFromUri('https://justadudewhohacks.github.io/face-api.js/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri('https://justadudewhohacks.github.io/face-api.js/models')
]).then(startApp).catch(err => {
    console.error("Error loading models:", err);
    alert("モデルの読み込みに失敗しました。インターネット接続を確認してください。");
});

function startApp() {
    console.log("Models loaded");
}

// Drag and Drop events
['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    uploadSection.addEventListener(eventName, preventDefaults, false);
    document.body.addEventListener(eventName, preventDefaults, false);
});

function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
}

['dragenter', 'dragover'].forEach(eventName => {
    uploadSection.addEventListener(eventName, highlight, false);
});

['dragleave', 'drop'].forEach(eventName => {
    uploadSection.addEventListener(eventName, unhighlight, false);
});

function highlight(e) {
    uploadSection.classList.add('drag-over');
}

function unhighlight(e) {
    uploadSection.classList.remove('drag-over');
}

uploadSection.addEventListener('drop', handleDrop, false);

function handleDrop(e) {
    const dt = e.dataTransfer;
    const files = dt.files;
    handleFiles(files);
}

imageUpload.addEventListener('change', (e) => {
    handleFiles(e.target.files);
});

async function handleFiles(files) {
    if (files.length === 0) return;

    processedImages = []; // Reset
    downloadBtn.disabled = true;
    placeholder.classList.add('hidden');
    loading.classList.remove('hidden');
    controls.classList.remove('hidden');
    carouselControls.classList.add('hidden');
    previewContainer.innerHTML = ''; // Clear previous previews
    previewContainer.className = 'preview-container'; // Reset classes

    const totalFiles = files.length;

    for (let i = 0; i < totalFiles; i++) {
        const file = files[i];
        updateLoadingText(`処理中... ${i + 1} / ${totalFiles}`);

        try {
            const result = await processImage(file);
            if (result) {
                processedImages.push(result);
            }
        } catch (err) {
            console.error(`Error processing file ${file.name}:`, err);
        }
    }

    updateLoadingText(`処理完了`);
    loading.classList.add('hidden');

    if (processedImages.length > 0) {
        downloadBtn.disabled = false;
        renderPreviews();

        if (processedImages.length > 1) {
            downloadBtn.textContent = `まとめて保存 (${processedImages.length}枚)`;
        } else {
            downloadBtn.textContent = "画像を保存";
        }
    } else {
        alert("画像の処理に失敗しました。");
        placeholder.classList.remove('hidden');
    }
}

const thumbnailContainer = document.getElementById('thumbnailContainer');

function renderPreviews() {
    const count = processedImages.length;

    // Reset containers
    previewContainer.className = 'preview-container';
    previewContainer.innerHTML = '';
    thumbnailContainer.innerHTML = '';
    thumbnailContainer.classList.add('hidden');
    carouselControls.classList.add('hidden');

    // Always use Carousel Mode
    previewContainer.classList.add('carousel-view');
    carouselControls.classList.remove('hidden');
    thumbnailContainer.classList.remove('hidden');
    currentSlideIndex = 0;

    // Render Main Images (Hidden by default)
    processedImages.forEach((imgData, index) => {
        const img = document.createElement('img');
        img.src = imgData.dataURL;
        img.alt = imgData.filename;
        if (index === 0) img.style.display = 'block';
        else img.style.display = 'none';
        previewContainer.appendChild(img);
    });

    // Render Thumbnails
    processedImages.forEach((imgData, index) => {
        const thumb = document.createElement('img');
        thumb.src = imgData.dataURL;
        thumb.className = 'thumbnail';
        if (index === 0) thumb.classList.add('active');

        thumb.addEventListener('click', () => {
            currentSlideIndex = index;
            updateCarousel();
        });

        thumbnailContainer.appendChild(thumb);
    });

    updateCarousel();
}

function updateCarousel() {
    const images = previewContainer.querySelectorAll('img');
    const thumbnails = thumbnailContainer.querySelectorAll('.thumbnail');

    // Update Main Image
    images.forEach((img, index) => {
        if (index === currentSlideIndex) {
            img.style.display = 'block';
        } else {
            img.style.display = 'none';
        }
    });

    // Update Thumbnails
    thumbnails.forEach((thumb, index) => {
        if (index === currentSlideIndex) {
            thumb.classList.add('active');
            thumb.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
        } else {
            thumb.classList.remove('active');
        }
    });

    slideCounter.textContent = `${currentSlideIndex + 1} / ${processedImages.length}`;
}

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

function updateLoadingText(text) {
    const p = loading.querySelector('p');
    if (p) p.textContent = text;
}

async function processImage(file) {
    if (!sunglassesLoaded) {
        await new Promise(resolve => {
            if (sunglassesLoaded) resolve();
            else sunglassesImg.onload = () => {
                sunglassesLoaded = true;
                resolve();
            };
        });
    }

    // Determine filename
    let originalFileName = file.name;
    const lastDotIndex = originalFileName.lastIndexOf('.');
    if (lastDotIndex !== -1) {
        originalFileName = originalFileName.substring(0, lastDotIndex);
    }

    // Create an image element from the file
    const img = await faceapi.bufferToImage(file);

    // Use a temporary canvas for processing
    const tempCanvas = document.createElement('canvas');
    const tempCtx = tempCanvas.getContext('2d');
    tempCanvas.width = img.width;
    tempCanvas.height = img.height;
    tempCtx.drawImage(img, 0, 0);

    try {
        // Detect faces
        const detections = await faceapi.detectAllFaces(img, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks();

        if (detections.length === 0) {
            console.warn(`No faces detected in ${file.name}`);
            return null; // Skip if no face
        }

        // Draw sunglasses for each face
        detections.forEach(detection => {
            const landmarks = detection.landmarks;
            const leftEye = landmarks.getLeftEye();
            const rightEye = landmarks.getRightEye();
            const nose = landmarks.getNose();
            const jaw = landmarks.getJawOutline();

            // Calculate eye centers
            const leftEyeCenter = getCenter(leftEye);
            const rightEyeCenter = getCenter(rightEye);

            // Calculate angle (Roll)
            const dy = rightEyeCenter.y - leftEyeCenter.y;
            const dx = rightEyeCenter.x - leftEyeCenter.x;
            const angle = Math.atan2(dy, dx);

            // Calculate eye distance
            const eyeDistance = Math.sqrt(dx * dx + dy * dy);

            // Calculate Yaw
            const noseBridge = nose[1]; // Point 28 (top of bridge)
            const leftFaceEdge = jaw[0];
            const rightFaceEdge = jaw[16];

            const distToLeft = Math.abs(noseBridge.x - leftFaceEdge.x);
            const distToRight = Math.abs(rightFaceEdge.x - noseBridge.x);
            const faceWidth = distToLeft + distToRight;

            const yawRatio = distToLeft / faceWidth;
            // const yaw = (yawRatio - 0.5) * 2;

            let widthMultiplier = 2.2;
            const glassesWidth = eyeDistance * widthMultiplier;
            const glassesHeight = glassesWidth * (sunglassesImg.height / sunglassesImg.width);

            // Use Nose Bridge for X center (handles parallax better than eye midpoint)
            // But blend with eye midpoint to be safe
            const eyeMidpointX = (leftEyeCenter.x + rightEyeCenter.x) / 2;
            const centerX = noseBridge.x * 0.7 + eyeMidpointX * 0.3;

            // Use Eye Center for Y, with offset
            const centerY = (leftEyeCenter.y + rightEyeCenter.y) / 2 + (glassesHeight * 0.15);

            // Draw rotated image
            tempCtx.save();
            tempCtx.translate(centerX, centerY);
            tempCtx.rotate(angle);

            // Improve image quality
            tempCtx.imageSmoothingEnabled = true;
            tempCtx.imageSmoothingQuality = 'high';

            // Optional: Scale X slightly if Yaw is significant to simulate perspective?
            // tempCtx.scale(1 - Math.abs(yaw) * 0.1, 1); 

            tempCtx.drawImage(sunglassesImg, -glassesWidth / 2, -glassesHeight / 2, glassesWidth, glassesHeight);
            tempCtx.restore();
        });

        return {
            filename: `${originalFileName}_edit.png`,
            dataURL: tempCanvas.toDataURL('image/png')
        };

    } catch (error) {
        console.error("Error during processing:", error);
        return null;
    }
}

function getCenter(points) {
    const x = points.reduce((sum, p) => sum + p.x, 0) / points.length;
    const y = points.reduce((sum, p) => sum + p.y, 0) / points.length;
    return { x, y };
}

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
        // Zip download
        const zip = new JSZip();

        processedImages.forEach(img => {
            // Remove data:image/png;base64, prefix
            const base64Data = img.dataURL.split(',')[1];
            zip.file(img.filename, base64Data, { base64: true });
        });

        zip.generateAsync({ type: "blob" })
            .then(function (content) {
                const link = document.createElement('a');
                link.download = "sunglasses_photos.zip";
                link.href = URL.createObjectURL(content);
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            });
    }
});
