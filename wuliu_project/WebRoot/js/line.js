function fun_select_addany(theform){
	
    var i; 
    for (i=0;i<theform.left_select.length;i++){
        if (theform.left_select.options[i].selected == true){
           if (theform.left_select.options[i].text !=""){
              theform.right_select.options[theform.right_select.length]=new Option(theform.left_select.options[i].text,theform.left_select.options[i].value);
              theform.left_select.options[i] =new Option("");
              }
       } 
    }
    for (i=0;i<theform.left_select.length;i++){
        if (theform.left_select.options[i].text ==""){theform.left_select.options.remove(i); i--;}
    } 
} 

function fun_select_addall(theform){
	
    var i;   
    for (i=0;i<theform.left_select.length;i++){
        if (theform.left_select.options[i].text !=""){
           theform.right_select.options[theform.right_select.length]=new Option(theform.left_select.options[i].text,theform.left_select.options[i].value);
           }       
    }
    theform.left_select.length=0;     
}  

function fun_select_dltany(theform){
	
   var i; 
    for (i=0;i<theform.right_select.length;i++){
        if (theform.right_select.options[i].selected == true){
           if (theform.right_select.options[i].text !=""){
              theform.left_select.options[theform.left_select.length]=new Option(theform.right_select.options[i].text,theform.right_select.options[i].value);
              theform.right_select.options[i] =new Option("");
              }
       } 
    }
    for (i=0;i<theform.right_select.length;i++){
        if (theform.right_select.options[i].text ==""){theform.right_select.options.remove(i);i--;}
    } 
}

function fun_select_dltall(theform){

    var i;   
    for (i=0;i<theform.right_select.length;i++){
        if (theform.right_select.options[i].text !=""){
           theform.left_select.options[theform.left_select.length]=new Option(theform.right_select.options[i].text,theform.right_select.options[i].value);
           }
    }
    theform.right_select.length=0;            
}    
