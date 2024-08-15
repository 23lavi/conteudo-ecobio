let currentSlide = 0;

function showSlide(index) {
    const slides = document.querySelector('.slides');
    const totalSlides = document.querySelectorAll('.slide').length;
    if (index >= totalSlides) {
        currentSlide = 0;
    } else if (index < 0) {
        currentSlide = totalSlides - 1;
    } else {
        currentSlide = index;
    }
    slides.style.transform = `translateX(-${currentSlide * 100}%)`;
}

function nextSlide() {
    showSlide(currentSlide + 1);
}

function prevSlide() {
    showSlide(currentSlide - 1);
}


setInterval(nextSlide, 5000); 

document.getElementById('content-btn').addEventListener('click', () => {
    const links = document.getElementById('content-links');
    links.style.display = links.style.display === 'block' ? 'none' : 'block';
});


document.addEventListener('DOMContentLoaded', function() {
    const currentPage = window.location.pathname.split('/').pop(); 
    const navItems = document.querySelectorAll('.nav-item');

    navItems.forEach(item => {
        if(item.getAttribute('href') === currentPage) {
            item.classList.add('active'); 
        }
    });
});