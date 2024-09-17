import { Directive, HostBinding } from "@angular/core";

@Directive({
  // eslint-disable-next-line @angular-eslint/directive-selector
  selector: "[button-in-nav]",
  standalone: true,
})
export class ButtonInNavDirective {
  private spacing = "px-2";
  private sizing = "h-8";
  private typography = "text-primary hover:text-secondary";
  private backgrounds = "hover:bg-primary";
  private borders =
    "rounded hover:outline focus-visible:outline outline-1 outline-primary hover:outline-offset-2 focus-visible:outline-offset-2";
  private effects = "disabled:opacity-75";
  private filters = "hover:drop-shadow";
  private transitions = "transition-all";
  private transforms = "enabled:active:translate-y-0.5";
  private interactivity = "disabled:cursor-not-allowed";

  @HostBinding("class")
  private hostClass =
    `${this.spacing} ${this.sizing} ${this.typography} ${this.backgrounds} ${this.borders} ${this.effects} ${this.filters} ${this.transitions} ${this.transforms} ${this.interactivity}`;
}
