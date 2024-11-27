export async function verifyToken(url) {
    const token = localStorage.getItem("token")

    if (!token) {
        window.location.href = url
        return
    }

    const response = await fetch("https://backendfinal-phi.vercel.app/verify", {
        headers: {
            "authorization": token  
        }
    }).then(response => response.json())

    if (!response.ok) {
        alert(response.message)
        window.location.href = url
    }
}