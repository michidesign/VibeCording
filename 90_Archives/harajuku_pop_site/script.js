document.addEventListener('DOMContentLoaded', () => {
    console.log("Welcome to Harajuku Pop World! 🦄");

    // Magic Button Effect
    const magicBtn = document.getElementById('magicBtn');
    magicBtn.addEventListener('click', () => {
        createConfetti();
        magicBtn.textContent = "キラキラ〜！ 🌟";
        setTimeout(() => {
            magicBtn.textContent = "クリックして魔法をかける ✨";
        }, 2000);
    });

    // Mouse Trail Effect
    let isDrawing = false;
    document.addEventListener('mousemove', (e) => {
        if (Math.random() > 0.85) { // Limit creation rate
            createSparkle(e.clientX, e.clientY);
        }
    });

    function createSparkle(x, y) {
        const sparkle = document.createElement('div');
        sparkle.classList.add('sparkle');

        const emojis = ['✨', '💖', '⭐', '🍭', '🦄'];
        sparkle.textContent = emojis[Math.floor(Math.random() * emojis.length)];

        sparkle.style.position = 'fixed';
        sparkle.style.left = x + 'px';
        sparkle.style.top = y + 'px';
        sparkle.style.pointerEvents = 'none';
        sparkle.style.fontSize = Math.random() * 20 + 10 + 'px';
        sparkle.style.opacity = '1';
        sparkle.style.transition = 'all 1s ease-out';
        sparkle.style.zIndex = '9999';

        document.body.appendChild(sparkle);

        // Animate
        setTimeout(() => {
            sparkle.style.transform = `translate(${Math.random() * 50 - 25}px, ${Math.random() * 50 + 25}px) rotate(${Math.random() * 180}deg)`;
            sparkle.style.opacity = '0';
        }, 10);

        // Remove
        setTimeout(() => {
            sparkle.remove();
        }, 1000);
    }

    function createConfetti() {
        for (let i = 0; i < 50; i++) {
            const confetti = document.createElement('div');
            confetti.style.position = 'fixed';
            confetti.style.left = '50%';
            confetti.style.top = '50%';
            confetti.style.width = '10px';
            confetti.style.height = '10px';
            confetti.style.backgroundColor = `hsl(${Math.random() * 360}, 100%, 50%)`;
            confetti.style.borderRadius = '50%';
            confetti.style.zIndex = '10000';
            confetti.style.pointerEvents = 'none';
            document.body.appendChild(confetti);

            const angle = Math.random() * Math.PI * 2;
            const velocity = Math.random() * 200 + 50;
            const x = Math.cos(angle) * velocity;
            const y = Math.sin(angle) * velocity;

            confetti.animate([
                { transform: 'translate(0, 0) scale(1)', opacity: 1 },
                { transform: `translate(${x}px, ${y}px) scale(0)`, opacity: 0 }
            ], {
                duration: 1000,
                easing: 'cubic-bezier(0, .9, .57, 1)',
                fill: 'forwards'
            }).onfinish = () => confetti.remove();
        }
    }
});
