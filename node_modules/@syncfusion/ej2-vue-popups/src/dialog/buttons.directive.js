var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    }
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import Vue from 'vue';
import { EJComponentDecorator } from '@syncfusion/ej2-vue-base';
var ButtonsDirective = /** @class */ (function (_super) {
    __extends(ButtonsDirective, _super);
    function ButtonsDirective() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    ButtonsDirective.prototype.render = function () {
        return;
    };
    ButtonsDirective = __decorate([
        EJComponentDecorator({})
    ], ButtonsDirective);
    return ButtonsDirective;
}(Vue));
export { ButtonsDirective };
export var ButtonsPlugin = {
    name: 'e-buttons',
    install: function (Vue) {
        Vue.component(ButtonsPlugin.name, ButtonsDirective);
    }
};
/**
 * 'e-button' directive represent a button of Vue Dialog
 * It must be contained in a Dialog component(`ejs-dialog`).
 * ```html
 * <ejs-Dialog id='dialog' :showCloseIcon=true>
 *   <e-buttons>
 *    <e-dialogbutton :buttonModal='okButton'></e-dialogbutton>
 *    <e-dialogbutton :buttonModal='cancelButton'></e-dialogbutton>
 *   </e-buttons>
 * </ejs-Dialog>
 * ```
 */
var DialogButtonDirective = /** @class */ (function (_super) {
    __extends(DialogButtonDirective, _super);
    function DialogButtonDirective() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    DialogButtonDirective.prototype.render = function () {
        return;
    };
    DialogButtonDirective = __decorate([
        EJComponentDecorator({})
    ], DialogButtonDirective);
    return DialogButtonDirective;
}(Vue));
export { DialogButtonDirective };
export var DialogButtonPlugin = {
    name: 'e-dialogbutton',
    install: function (Vue) {
        Vue.component(DialogButtonPlugin.name, DialogButtonDirective);
    }
};
