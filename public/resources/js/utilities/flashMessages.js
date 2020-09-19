CSLP.Utilities.FlashMessages = function() {
    //Definicion de las clases a usar
    var _classes = {
        types : {
            top : "topFlashMessage",
            center : "centerFlashMessage"
        },

        states : {
            success : "msg_success",
            warning : "msg_warning",
            error : "msg_error",
            info : "msg_info"
        }
    };

    //FUNCIONES DE CREACION DE FLASH-MESSAGES
    function make(type, state, msg, time) {

        var flash_msg = $("<div>");
        flash_msg.addClass(_classes.types[type]);
        flash_msg.addClass(_classes.states[state]);
        flash_msg.html(msg);

        var message = {
            view : flash_msg,
            //Remueve y elimina el mensaje
            remove : function(){
                var self = this;
                this.view.fadeOut(400, function() {
                    self.view.remove();
                    self.view = undefined;
                });

            }
        };

        message.view.on('click', function() {
            message.remove();
        });

        if(type === 'center')
            message.view.appendTo('body');


        //Si se especifica un tiempo, se irá automaticamente finalizado este
        if(time !== undefined) {
            setTimeout(function() {
                //softMsgRemove(flash_msg);
                message.remove();
            }, time);
        }else{
            return message;
        }

    }

    function flashMsg(msg, state, duration) {
        make('center', state, msg, duration || 3500);
    }

    //Genera un mensaje estatico que no se va de pantalla automaticamente
    function staticMsg(msg, state) {
        return make('center', state, msg)
    }

    return {

        success : function(message, duration) {
            if(duration == false)
                return staticMsg(message, 'success');
            flashMsg(message, 'success', duration);
        },

        info : function(message, duration) {
            if(duration == false)
                return staticMsg(message, 'info');
            flashMsg(message, 'info', duration);
        },

        error : function(message, duration) {
            if(duration == false)
                return staticMsg(message, 'error');
            flashMsg(message, 'error', duration);
        },

        warning : function(message, duration) {
            if(duration == false)
                return staticMsg(message, 'warning');
            flashMsg(message, 'warning', duration);
        },

        make : function(type, state, msg, time) {
            return make(type, state, msg, time);
        }
    }
};

CSLP.message = CSLP.Utilities.FlashMessages();
