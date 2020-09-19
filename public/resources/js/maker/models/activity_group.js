CSLP.Maker.Models.ActivityGroup = Backbone.Model.extend({

    defaults : {
        name : 'group',

        locked : true,
        completed: false,
        //Collection de actividades
        activitiesCollection : undefined
    },

    view : undefined,
    progress : 0,

    initialize : function(){
        this.initCollection();

        this.generateView();


        this.add(this.get('activities'));
    },

    //Agrega una o mas actividades al grupo
    add : function(activities){
        this.getCollection().add(activities);
    },

    addNewActivity : function(activity){
        this.add(activity);

        $.post(basePath + '/maker/newactivity',{
            id : this.get('id')
        },function(response){
            activity.attributes.id = response.id;
        });
    },

    initCollection : function(){
        this.attributes.activitiesCollection = new CSLP.Maker.Collections.Activities;
        this.getCollection().parent = this;
    },

    //Itera por todos los modelos del collection
    forEach : function(fn){
        this.getCollection().forEach(fn);
    },

    //Retorna el collection de actividades
    getCollection : function(){
        return this.get('activitiesCollection');
    },

    //Genera la vista
    generateView : function(){
        this.view = new CSLP.Maker.Views.ActivityGroup({
            model : this
        });
    },

    save : function(){
        //Guarda el nombre del grupo en la BD
        $.post(basePath + '/maker/savegroupname',{
            id : this.get('id'),
            name : this.get('name')
        },function(){

        })
    }
});