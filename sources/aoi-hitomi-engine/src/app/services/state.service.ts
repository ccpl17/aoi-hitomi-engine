import { Injectable, signal, WritableSignal } from "@angular/core";

@Injectable({
  providedIn: "root",
})
export class StateService {
  public readonly appWindowIsFullscreen: WritableSignal<boolean> =
    signal(false);
}
