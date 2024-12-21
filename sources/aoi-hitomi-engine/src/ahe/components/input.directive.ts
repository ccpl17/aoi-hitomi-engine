import { Directive, HostBinding } from "@angular/core";

@Directive({
  // eslint-disable-next-line @angular-eslint/directive-selector
  selector: "[ah-input]",
  standalone: true,
})
export class AhInputDirective {
  private spacing = "px-2";
  private sizing = "h-8";
  private backgrounds = "bg-white";
  private borders =
    "rounded focus:outline outline-1 outline-secondary focus:outline-offset-1";
  private effects = "shadow-[0_0_.25rem_rgba(0,0,0,.25)] disabled:opacity-75";
  private filters = "drop-shadow";
  private transitions = "transition-all";
  private interactivity = "disabled:cursor-not-allowed";

  @HostBinding("class")
  private hostClass =
    `${this.spacing} ${this.sizing} ${this.backgrounds} ${this.borders} ${this.effects} ${this.filters} ${this.transitions} ${this.interactivity}`;
}
