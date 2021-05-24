CSLP.Admin.Models.Course = Backbone.Model.extend({
    defaults : {
        id : undefined,
        name : '',
        code : ''
    },

    view : undefined,

    initialize : function() {
    },

    delete : function() {
        var self = this;
        $.post(basePath + '/courses/deletecourse', {
            id : this.get('id')
        }, function(response) {
            self.id = undefined;
            self.destroy();
        });
    },

    save : function() {
        var data = this.toJSON();
        var self = this;
        var isNew = this.get('id') === undefined;
        $.post(basePath + '/courses/savecourse', data, function(modelId) {
            self.set('id', modelId);
            //Solo cuando es recibido el id del curso se puede agregar al collection si el curso es nuevo
            if(isNew)
                window.collections.courses.add(self);
        })
    }
});