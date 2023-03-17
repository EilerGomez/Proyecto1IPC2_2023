/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
(function(){
    var buton = document.querySelector("#RechazarPedido");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "motivoRechazoPedido.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#AprobarPedido");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "confirmarAcepacionPedido.jsp");
        xhr.send();        
    }
})();

