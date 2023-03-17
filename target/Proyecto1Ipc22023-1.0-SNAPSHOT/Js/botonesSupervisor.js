/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

(function(){
    var buton = document.querySelector("#tablaPedidos");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/tablaPedidosTiendasSupervisadas.jsp");
        xhr.send();        
    }
})();

(function(){
    var buton = document.querySelector("#AprobarPedidos");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/tablaPedidosPendientes.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#buscarPorTienda");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/buscarPedidoPorTienda.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#buscarPedidosPorCodigoTienda");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/buscarTodosPedidosPorTienda.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#buscarPedidosPorEstado");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/buscarTodosPedidosPorEstado.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#buscarPedidosPorFecha");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/buscarTodosPedidosPorFecha.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#buscarPedidosPorFechaEstadoYCodigoT");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelSupervisor/buscarTodosPedidosPorFechaEstadoYTienda.jsp");
        xhr.send();        
    }
})();




