function setInput(type, name, value){
    return '<input type="'+type+'" name="'+name+'" class="form-control" value="'+value+'" />';
}
function replaceInput(pt, type, name){
    $(pt).html(setInput(type, name, pt.html()));
}
function replaceInputs(pt, pos, type, name){
    for(var i=0; i<type.length; i++){
        switch(type){
            case 'text': replaceInput(pt.eq(pos[i]), type[i], name[i]); break;
            case 'number': replaceInput(pt.eq(pos[i]), type[i], name[i]); break;
            case 'select': replaceInput(pt.eq(pos[i]), type[i], name[i]); break;    
        }
        
    }
}
function getInput(pt){
    $(pt).html(pt.val());
}
function getSelect(pt){
    $(pt).replaceWith(pt.children('option[value="'+pt.val()+'"]')).html();
}
function replaceContent(pt, value){
    $(pt).replaceWith(value);
}
function resetAction(pt, type){
    var str = '';
    if(type==0){
        pt.html('<a href="javascript:;" onclick="save($(this))" class="btn btn-primary"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a> <a href="javascript:;" onclick="remove($(this))" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>');
    }else{
        pt.html('<a href="javascript:;" onclick="update($(this))" class="btn btn-success"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>');
    }
}
function replaceUpdate(pt){
    resetAction(pt.parents('td'), 0);
}
function replaceSave(pt){
    resetAction(pt.parents('td'), 1);
}