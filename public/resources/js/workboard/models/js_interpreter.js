CSLP.Workboard.Models.JSInterpreter = Backbone.Model.extend({
    defaults : {},

    initialize : function() {

    },

    loadPrimitives : function(interpreter, scope) {
        // Agrega a la API la funcion alert
        var wrapper = function(text) {
            text = text ? text.toString() : '';
            return interpreter.createPrimitive(alert(text));
        };
        interpreter.setProperty(scope, 'alert', interpreter.createNativeFunction(wrapper));

        // Agrega la funcion a la API para usar prompt()
        wrapper = function(text) {
            text = text ? text.toString() : '';
            return interpreter.createPrimitive(prompt(text));
        };
        interpreter.setProperty(scope, 'prompt', interpreter.createNativeFunction(wrapper));

        //Agrega la funcion a la API para iliminar bloques
        wrapper = function(id) {
            id = id ? id.toString() : '';
            return interpreter.createPrimitive(window.blocklyPanel.highlightBlock(id));
        };
        interpreter.setProperty(scope, 'highlightBlock', interpreter.createNativeFunction(wrapper));

        // Agrega la funcion a la API para imprimir en consola
        wrapper = function(value) {
            value = value ? value.toString() : '';
            return interpreter.createPrimitive(window.consolePanel.print(value));
        };
        interpreter.setProperty(scope, 'imprimir', interpreter.createNativeFunction(wrapper));
    },

    getInterpreter : function(code) {
        return new Interpreter(code, this.loadPrimitives);
    },

    run : function(code) {
        var interpreter = this.getInterpreter(code);
        interpreter.run();
    }
});