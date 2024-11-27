export function logout() {
    const button = document.querySelector(".user button")
    button.addEventListener("click", () => {
        localStorage.removeItem("token")
        window.location.reload()
    })  
}