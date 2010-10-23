function alignHeight(eleA,eleB){
    if(!document.getElementById(eleA)){return false;}
    if(!document.getElementById(eleB)){return false;}
    var heightA = document.getElementById(eleA).clientHeight;
    var heightB = document.getElementById(eleB).clientHeight;
    if(heightA > heightB){
        document.getElementById(eleB).style.height = heightA + "px";
        document.getElementById(eleA).style.height = heightA + "px";
    }else{
        document.getElementById(eleA).style.height = heightB + "px";
        document.getElementById(eleB).style.height = heightB + "px";
    }
}

window.onload = function z_align(){
    alignHeight("sidebar_application","main");
}
