document.getElementById('clicker').addEventListener('click', () => {

    const message = document.createElement('p');
    message.innerText = 'clicked';

    document.querySelector('body').appendChild(message);

});