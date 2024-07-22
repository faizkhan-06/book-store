const slider = document.querySelector('.slider');
        const slides = document.querySelectorAll('.slide');
        let currentSlide = 0;

        function showSlide(slideIndex) {
            if (slideIndex < 0) {
                slideIndex = slides.length - 1;
            } else if (slideIndex >= slides.length) {
                slideIndex = 0;
            }

            slider.style.transform = `translateX(-${slideIndex * 100}%)`;
            currentSlide = slideIndex;
        }

        document.querySelector('.prev').addEventListener('click', () => {
            showSlide(currentSlide - 1);
        });

        document.querySelector('.next').addEventListener('click', () => {
            showSlide(currentSlide + 1);
        });

        // Auto-advance to the next slide every 3 seconds
        setInterval(() => {
            showSlide(currentSlide + 1);
        }, 3000);
