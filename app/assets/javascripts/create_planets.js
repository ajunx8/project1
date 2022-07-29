console.log('hello')

$(document).ready(function () {
    $('#time-start').on('click', function () {
        alert('Your Food is now Depleting')
    }) 

    // let loadTime = 5000
    // const splitURL = window.prevPage.split('/planets/');

    // // set the Load time as 0 when previous page was the planets show page
    // if (splitURL.length === 2) {
    //     if (splitURL[1] !== 'new') {
    //         loadTime = 0;
    //     }
    // }

    setTimeout(() => {
        $('.loading').hide();
        $('.content').css('visibility', 'visible');
    }, randomIntFromInterval(2000, 4000));

    window.prevPage = window.location.href;
})

function randomIntFromInterval(min, max) { 
    return Math.floor(Math.random() * (max - min + 1) + min)
}
