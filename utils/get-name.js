export async function getName() {
    const token = localStorage.getItem ("token")

    if(!token) {
        return
    }
   
    const response = await fetch("https://backendfinal-phi.vercel.app/getname", {
        headers: {
            "Authorization": token
        }
            
    }).then(response => response.json())

    const nameP = document.querySelector(".user p")
    nameP.innerText = `Usuário: ${response.name}`
}
    