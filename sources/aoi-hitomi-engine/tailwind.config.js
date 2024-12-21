/** @type {import("tailwindcss").Config} */
module.exports = {
  content: ["./src/**/*.{html,ts}"],
  theme: {
    extend: {
      colors: {
        primary: "#c8b89e",
        secondary: "#24231f",
        accent: "#7f0020",
        success: "#28a745",
        critical: "#ed5a5a",
      },
    },
  },
};
