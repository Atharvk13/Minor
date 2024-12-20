
const div7 = document.querySelector('.home-div-7');

div7.addEventListener('click', function() {
     
    document.body.classList.toggle('dark-mode');

     const div2 = document.querySelector('.home-div-2');
    div2.classList.toggle('dark-mode');

 
     const button = this.querySelector('button');
    if (document.body.classList.contains('dark-mode')) {
        button.textContent = 'Light Mode';
    } else {
        button.textContent = 'Dark Mode';
    }
});
