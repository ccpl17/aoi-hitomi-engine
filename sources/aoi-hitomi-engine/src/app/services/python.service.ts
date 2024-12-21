import { inject, Injectable } from "@angular/core";

import { StateService } from "./state.service";

@Injectable({
  providedIn: "root",
})
export class PythonService {
  private readonly state: StateService = inject(StateService);

  public readonly toggleAppWindowFullscreen = async (): Promise<void> =>
    await window.pywebview.api
      .toggle_app_window_fullscreen()
      .then((): void =>
        this.state.appWindowIsFullscreen.set(
          !this.state.appWindowIsFullscreen(),
        ),
      )
      .catch();
}
