window.CSLP = {
    Helper : {},
    Utilities : {},
    Exercises : {
        Models : {},
        Collections : {},
        Views : {}
    },
    Maker : {
        Models : {},
        Collections : {},
        Views : {}
    },
    Workboard : {
        Models : {},
        Collections : {},
        Views : {}
    },
    Admin : {
        Models : {},
        Collections : {},
        Views : {}
    }
};

window.app = {};
window.views = {};
window.collections = {};

//Configuracion global
window.app.config = {
    mode : 'fixed'
}

/**
 * PARSLEY CONFIGURATION
 */
    //Le indica que la validacion se produzca cuando el input lanze el evento change
Parsley.options.trigger = 'change';

/**
 *
 * TOUR HELPER CONFIGURATION
 *
 */
CSLP.Helper.Tour = function(steps) {

    var helper = introJs();
    helper.setOptions({
        nextLabel : 'Siguiente',
        prevLabel : 'Anterior',
        skipLabel : 'Salir',
        doneLabel : 'Finalizar',
        tooltipPosition : 'auto', //Default tooltip position
        positionPrecedence : ["bottom-middle-aligned", "bottom", "top", "right", "left"], //preferencia de posicion cuando esta en "auto"
        //tooltipClass: Adding CSS class to all tooltips
        //highlightClass: Additional CSS class for the helperLayer
        exitOnEsc : true,
        exitOnOverlayClick : false,
        showStepNumbers : true,
        keyboardNavigation : true,
        showButtons : true,
        showBullets : true,
        showProgress : true,
        scrollToElement : true, //Auto scroll to highlighted element if it's outside of viewport
        //overlayOpacity: Adjust the overlay opacity, Number
        disableInteraction : false, //Disable an interaction inside element or not
        //hintPosition: Hint position. Default: top-middle
        hintButtonLabel : 'Entiendo!'
    });

    steps = steps || [];

    helper.setOption('steps', steps);

    var helperView = $('#cslp-helper');

    helperView.on('click', function() {
        helperView.addClass('hidden-helper');
        helper.start();
    });
    helper.oncomplete(function() {
        helperView.removeClass('hidden-helper');
    });
    helper.onexit(function() {
        helperView.removeClass('hidden-helper');
    });
    helper.onbeforechange(function() {
        if(this._introItems[this._currentStep - 1] != undefined) {
            if(this._introItems[this._currentStep - 1].onComplete != undefined)
                this._introItems[this._currentStep - 1].onComplete();
        }
    });

    return helper;
};