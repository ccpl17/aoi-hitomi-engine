import { Directive, HostBinding } from "@angular/core";

@Directive({
  // eslint-disable-next-line @angular-eslint/directive-selector
  selector: "[ah-button]",
  standalone: true,
})
export class AhButtonDirective {
  private spacing = "px-4";
  private sizing = "h-8";
  private backgrounds = "bg-white enabled:hover:bg-neutral-100";
  private borders =
    "rounded border focus-visible:outline outline-2 outline-secondary focus-visible:outline-offset-4";
  private effects = "disabled:opacity-75";
  private filters = "drop-shadow";
  private transitions = "transition-all";
  private transforms = "enabled:active:translate-y-0.5";
  private interactivity = "disabled:cursor-not-allowed";

  @HostBinding("class")
  private hostClass =
    `${this.spacing} ${this.sizing} ${this.backgrounds} ${this.borders} ${this.effects} ${this.filters} ${this.transitions} ${this.transforms} ${this.interactivity}`;
}
