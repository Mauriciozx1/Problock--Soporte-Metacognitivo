CSLP.Workboard.Views.CodePanel = Backbone.View.extend({

    events : {},

    code : undefined,
    prettyCode : undefined,

    initialize : function() {
        this.prettyCode = this.$('.prettyprint');
    },

    updateCode : function() {
        var code = window.blocklyPanel.getCode();
        this.prettyCode.html(code);

        //Resetea el estado para que no reconozca como codigo no formateado
        this.prettyCode.removeClass('prettyprinted');
        prettyPrint();
    },

});