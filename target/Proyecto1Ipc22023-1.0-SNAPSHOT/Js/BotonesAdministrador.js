/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

/*(function(){    
    var button=document.querySelector("#users");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/TablaDeUsuarios.jsp",true);
        xhr.send();
    }
})(); */
(function(){
    var buton = document.querySelector("#cargaDatos");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/cargarDatos.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#users");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/TablaUsuarios.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#verificar5TiendasMayorPedidos");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/5TiendasConMayorPedidos.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#verificar5UsuariosMayorPedidos");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/5UsuariosConMayorPedidos.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#verificar5UsuariosMayorEnvios");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/5UsuariosConMayorEnvios.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#productoMasPedidoEnTiendas");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/productoMasPedido.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#productosDañadosEnTiendas");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/productosDañadosPorTiendas.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#agregarTiendaAUsuariosBodega");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/tablaUsuariosBodega.jsp");
        xhr.send();        
    }
})();
(function(){
    var buton = document.querySelector("#agregarTiendaNormalUsuario");
    var divContenedor = document.getElementById("Contenido");
    buton.addEventListener("click",obtenerHTML, true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.status===200){
                divContenedor.innerHTML=xhr.responseText;
            }
        };
        xhr.open("get", "DelAdministrador/tablaUsuariosTienda.jsp");
        xhr.send();        
    }
})();


