CSLP.Workboard.Models.ActivityGroup = Backbone.Model.extend({

    defaults : {
        name : 'group',

        //Collection de actividades
        activitiesCollection : undefined,
        locked : true,
        completed : false,
    },

    view : undefined,
    progress : 0,

    initialize : function(){
        this.initCollection();


        var self = this;
        this.getCollection().on('add', function(model){
            self.trigger('add-activity',model);

            model.on('change',function(){
                self.calculateProgress();
                self.trigger('change');
            });

           self.calculateProgress();
        });

        this.generateView();


        this.add(this.get('activities'));
    },

    //Agrega una o mas actividades al grupo
    add : function(activities){
      this.getCollection().add(activities);
    },

    //Revisa las actividades en busca de un cambio en el estado del grupo
    updateStatus : function(){
        var locked = true;
        var completed = true;
        this.forEach(function(model) {
            //Si alguna de las actividades no esta completada el grupo tampoco puede estarlo
            if(model.get('completed') === false)
                completed = false;
            if(model.get('locked') === false)
                locked = false;
        });
        this.attributes.locked = locked;
        this.attributes.completed = completed;
        this.trigger('change');
    },

    calculateProgress : function(){
        var totalActivities = 0;
        var completedActivities = 0;

        this.forEach(function(model){
            totalActivities++;
            if(model.get('completed'))
                completedActivities++;
        });

        var progress = Math.round((completedActivities * 100)/totalActivities);
        if(this.progress != progress){
            this.progress = progress;
            if(progress == 100)
                this.set('completed',true);
                this.trigger('complete');
        }
    },

    //Calcula el porcentage de aprovacion promedio entre todas las actividades
    calculateSuccess : function(){
        var totalActivities = 0;
        var totalSuccess = 0;

        this.forEach(function(model){
            totalActivities++;
            totalSuccess += model.get('successPercent');
        });

        return Math.round(totalSuccess/totalActivities);
    },

    initCollection : function(){
        this.attributes.activitiesCollection = new CSLP.Workboard.Collections.Activities;
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
        this.view = new CSLP.Workboard.Views.ActivityGroup({
            model : this
        });
    }
});