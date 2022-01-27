const reviews = document.querySelectorAll('.far.fa-star')

const reviewsToggle = $(".fa-star").hover(function() {
    $(this).addClass("fas");
    $(this).removeClass("far");
    $(this).siblings().addClass("fas");
}, function() {
    $(this).removeClass("fas");
    $(this).addClass("far");
    $(this).siblings().removeClass("far");
});

export {reviewsToggle};
