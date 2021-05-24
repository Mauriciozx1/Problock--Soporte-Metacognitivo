CSLP.Workboard.Views.ScreenView = Backbone.View.extend({

    events : {

    },
    modelScreen : undefined,

    sends :[],
    
    initialize : function() {
        this.$el = $('#screen-popup');
        if(this.modelScreen == undefined)
            this.modelScreen = new CSLP.Workboard.Models.Screen();
        
    },
    show : function() {
      this.$el.toggle(300);  
    },
    render : function(){
        var array = this.sends;
        array.forEach(element =>{
            this.$('.content-section-screen-team').append('<div style="margin:10px" id="'+element.id+'"</div>');
            this.$('#' + element.id).html('<img style="max-width:400px;" id="img'+element.id+'" class="imgScreen" onclick="zoomimg(this)"></img><div class="alt-img"><span><strong style="color:#ffffff">Trabajo de: '+element.name+'</strong></span></div>');
            this.$('#img'+element.id).attr('src',element.img);
            
        })
    },
    add : function (data){
        var copy = false;
        if(this.sends.lenght == 0){
            this.sends.push(data);
        }else{
            this.sends.forEach(element =>{
                if(element.id == data.id){

                    element.img = data.img;
                    copy = true;
                }})  
            }
            if(copy == false){
                this.sends.push(data);
            }
        this.modelScreen.update(this.sends);
        this.render();
    }
});