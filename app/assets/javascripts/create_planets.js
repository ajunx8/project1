console.log('hello')

$(document).ready(function () {
    $('#time-start').on('click', function () {
        alert('Your Food is now Depleting')
    }) 

    setTimeout(() => {
        $('.loading').hide();
        $('.content').css('visibility', 'visible');
    }, 5000);
})

// $('.show_gif li').on('click', )