/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
(function(){
    var buton = document.querySelector("#nuevoEnvio");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelBodega/tablaPedidosSolicitados.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#TodosEnvios");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelBodega/todosEnvios.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#todasIncidencias");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelBodega/tablaIncidencias.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#solucionarIncidencias");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelBodega/buscarIncidenciasActivasPorTienda.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#incidenciasActivas");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelBodega/tablaIncidenciasActivas.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#todasDevoluciones");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelBodega/tablaDevoluciones.jsp");
        xhr.send();        
    }
})();




