CSLP.Exercises.Views.Modal = Backbone.View.extend({

    events : {
        'click .modal-fade' : 'toggle',
        'click .btn-save' : 'save',
        'click .btn-cancel' : 'toggle',
        'click .btn-delete' : 'deleteExercise'
    },

    model : undefined,

    initialize : function() {

    },

    render : function() {

    },
    setModel : function(model) {
        if(this.model !== model) {
            this.model = model;
            this.prepareUI();
        }
    },

    prepareUI : function() {

        this.$('#frm-name').val(this.model.get('name'));
        this.$('#frm-description').val(this.model.get('description'));
        this.$('#frm-idate').val(this.model.get('open_at').split(' ')[0]);
        this.$('#frm-itime').val(this.model.get('open_at').split(' ')[1]);
        this.$('#frm-fdate').val(this.model.get('close_at').split(' ')[0]);
        this.$('#frm-ftime').val(this.model.get('close_at').split(' ')[1]);
        this.$('#frm-type-problem').val(this.model.get('type_problem'));
         
        if(this.model.get('id')){
            
            this.$('.btn-delete').show();
            this.$('.input-teamworks').hide();
            this.$('.text-type-problem').show();
            this.$('.count-student').css('visibility', 'visible');
        
            if(this.model.get('type_problem') == 'Grupal'){
                this.$('.text-type-problem').val('Trabajo Grupal').change();
                this.$('.permiso-problem-t').show();
            }
            if(this.model.get('type_problem') == 'Individual'){
                this.$('.text-type-problem').val('Trabajo Individual').change();
                this.$('.permiso-problem-t').hide();
            }   
            
        
        }else{  
            this.$('.count-student').hide();
            this.$('.btn-delete').hide();
            this.$('.input-teamworks').show();
            this.$('.text-type-problem').hide();
            
        }
        

    },

    clean : function() {
        this.$('input textarea').val('');
    },

    toggle : function() {
        this.$el.toggle();
    },

    /**
     * EVENTS
     */


    save : function() {

        var data = {
            name : this.$('#frm-name').val().trim(),
            description : this.$('#frm-description').val().trim(),
            open_at : this.$('#frm-idate').val() + ' ' + this.$('#frm-itime').val(),
            close_at : this.$('#frm-fdate').val() + ' ' + this.$('#frm-ftime').val(),
            type_problem : this.$('#select-type-problem').val(),
            p_autoadd : this.$('#select-permise-problem').val()
        };
        this.model.set('name',data.name);
        this.model.set('description',data.description);
        this.model.set('open_at',data.open_at);
        this.model.set('close_at',data.close_at);

        if(this.model.get('type_problem') == ''){
            this.model.set('type_problem', data.type_problem);
        }else{
            this.model.set('type_problem', this.model.get('type_problem'));
        }
        this.model.set('p_autoadd',data.p_autoadd);
        console.log(data.type_problem);
        
        
        this.model.save();
        this.toggle();
        
    },
    deleteExercise : function() {
        var response = confirm('¿Seguro que quiere eliminar este ejercicio?');
        if(response){
            this.model.delete();
            this.toggle();
        }
    }
});