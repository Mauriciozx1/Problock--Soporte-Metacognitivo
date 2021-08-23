import Vue from 'vue';
export declare class ButtonsDirective extends Vue {
    render(): void;
}
export declare const ButtonsPlugin: {
    name: string;
    install(Vue: any): void;
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
export declare class DialogButtonDirective extends Vue {
    render(): void;
}
export declare const DialogButtonPlugin: {
    name: string;
    install(Vue: any): void;
};
