CSLP.Workboard.Views.Console = Backbone.View.extend({

    events : {},

    console : undefined,

    initialize : function() {
        this.console = this.$('#output-console');
    },

    //Limpia la consola
    clear : function() {
        this.console.html('');
    },

    //Imprime el mensaje en la consola
    print : function(output) {
        this.console.append('<i class="output-tag">>> </i>' + output + '<br/><br/>');
    }
});