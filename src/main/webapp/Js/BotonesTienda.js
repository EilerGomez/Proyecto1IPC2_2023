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
        xhr.open("get", "DelTienda/tablaPedidos.jsp");
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
        xhr.open("get", "DelTienda/tablaEnvios.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#enviosPendientes");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/tablaEnviosPendientes.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#crearIncidencia");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/tablaParaCrearIncidencias.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#crearDevolucion");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/tablaParaCrearDevolucion.jsp");
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
        xhr.open("get", "DelTienda/tablaIncidencias.jsp");
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
        xhr.open("get", "DelTienda/tablaDevoluciones.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#consultarProductosMenorQueExistencia");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/buscarProductosMenoresAXExistencia.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#consultarPedidosEnXTiempoXEstado");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/buscarPedidosEnXTiempoYEstado.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#consultarEnviosEnINtervaloTiempo");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/buscarEnviosRecibidosEnXTiempo.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#consultarIncidenciasEnXTiempo");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/buscarIncidenciasEnXTiempoYEstado.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#consultarDevolucionesEnXTiempo");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/buscarDevolucionesEnXTiempoYEstado.jsp");
        xhr.send();        
    }
})();

(function(){
    var buton = document.querySelector("#tablaPedidosRechazados");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelTienda/tablaPedidosRechazados.jsp");
        xhr.send();        
    }
})();


