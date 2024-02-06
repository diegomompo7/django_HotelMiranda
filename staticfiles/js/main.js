// OPEN MENU
const btnMenu = document.querySelector(".nav__icon")
const menuMobile = document.querySelector(".menu--mobile")


const btnClosed = document.createElementNS("http://www.w3.org/2000/svg", "svg");
btnClosed.classList.add("nav__icon")
btnClosed.setAttribute("width", "16");
btnClosed.setAttribute("height", "16");
btnClosed.setAttribute("viewBox", "0 0 16 16");
btnClosed.setAttribute("fill", "none");
btnClosed.setAttribute("onclick", "menuNav()")


const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
path.setAttribute("d", "M2.49153 13.5013L13.4941 2.49871M13.4941 13.5013L2.49153 2.49871");
path.setAttribute("stroke", "black");
path.setAttribute("stroke-width", "2");

// Agregar el elemento de ruta al SVG
btnClosed.appendChild(path);

menuMobile.style.display = "none"

const menuNav = () => {
    if (menuMobile.style.display === "none") {
        menuMobile.style.display = "block"
        document.querySelector("nav").replaceChild(btnClosed, btnMenu)
    } else {
        menuMobile.style.display = "none"
        document.querySelector("nav").replaceChild(btnMenu, btnClosed)
    }
}

const sendAlert = () => {
    alert("¡Thank you for your request! We have received it correctly. Someone from our Team will get back to you very soon.The Miranda Hotel")
}

const sendAlertContact = () => {
    alert("¡Thank you for your message! We have received it correctly. Someone from our Team will get back to you very soon.The Miranda Hotel")
}

document.body.addEventListener("mousemove", (event) => {

    const nav= document.getElementsByClassName("nav")

    if(window.scrollY >= 180 && window.innerWidth >= 1000){
        console.log(window.scrollY)
        console.log(event.clientY)

        if(event.clientY <= 10){
            console.log(nav[0])
        }
    }
})

