function replaceAll( text, busca, reemplaza ){
        while (text.toString().indexOf(busca) != -1)
        text = text.toString().replace(busca,reemplaza);
        return text;
            }

        function remplazarPublicacion(formulario){
            if(formulario.descripcion.value.length>0){
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"á","&aacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"é","&eacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"í","&iacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"ó","&oacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"ú","&uacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"Á","&Aacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"É","&Eacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"Í","&Iacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"Ó","&Oacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"Ú","&Uacute");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"ñ","&ntilde");
                formulario.descripcion.value=replaceAll(formulario.descripcion.value,"Ñ","&Ntilde");
                return true;
                ocultar();
            }else{
                window.location.reload();
                alert("¡No se pueden dejar campos vacios!");
                
                return false;
            }
        }
        
        function ocultar() {

        div = document.getElementById("boton2");

        div.style.display="none";

        div = document.getElementById("cargando");

        div.style.display="";

}

