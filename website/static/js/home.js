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
function mostrarNotificacion(mensaje, tipo) {
    // Realizar una solicitud AJAX para mostrar la notificación
    console.log(mensaje, tipo)
        Toastify({
            text: data.mensaje,
            duration: 3000,  // Duración de la notificación en milisegundos
            close: true,
            gravity: "top", // Posición de la notificación
            position: "center", // Alineación de la notificación
            backgroundColor: data.tipo === 'error' ? '#ff0000' : '#007bff' // Color de fondo basado en el tipo de notificación
        }).showToast();
};

