import { bootstrapApplication } from "@angular/platform-browser";
import { appConfig } from "./app/app.config";
import { AppComponent } from "./app/app.component";

declare global {
  interface Window {
    pywebview: {
      api: {
        toggle_app_window_fullscreen(): Promise<void>;
      };
    };
  }
}

bootstrapApplication(AppComponent, appConfig).catch((err) =>
  console.error(err),
);
