console.log('hello')

$(document).ready(function () {
    $('#time-start').on('click', function () {
        alert('Your Food is now Depleting')
    }) 

    setTimeout(() => {
        $('.loading').hide();
        $('.content').css('visibility', 'visible');
    }, randomIntFromInterval(4000, 5000));
})

function randomIntFromInterval(min, max) { 
    return Math.floor(Math.random() * (max - min + 1) + min)
}

