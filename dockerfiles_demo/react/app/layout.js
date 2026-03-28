export const metadata = {
  title: "Next API Client",
  description: "Call API from Next.js",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
