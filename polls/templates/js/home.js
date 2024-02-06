const checkAvability = document.querySelector(".check__form--button")

// VIDEO 
const video = document.getElementById("videoMiranda")


console.log(video.currentTime)

video.addEventListener("loadedmetadata", function() {
    video.currentTime = 25; // Set the start time to 25 seconds
});

video.addEventListener("timeupdate", function() {
    // Pause the video at 1:15
    if (video.currentTime >= 75) {
        video.pause();
    }
});
