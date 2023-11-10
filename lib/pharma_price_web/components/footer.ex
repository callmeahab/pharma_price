defmodule PharmaPriceWeb.Footer do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <footer class="footer p-10 bg-[#2C4341] text-white">
      <nav>
        <header class="footer-title text-[#61AC27]">Services</header>
        <a class="link link-hover">Branding</a>
        <a class="link link-hover">Design</a>
        <a class="link link-hover">Marketing</a>
        <a class="link link-hover">Advertisement</a>
      </nav>
      <nav>
        <header class="footer-title text-[#61AC27]">Company</header>
        <a class="link link-hover">About us</a>
        <a class="link link-hover">Contact</a>
        <a class="link link-hover">Jobs</a>
        <a class="link link-hover">Press kit</a>
      </nav>
      <nav>
        <header class="footer-title text-[#61AC27]">Legal</header>
        <a class="link link-hover">Terms of use</a>
        <a class="link link-hover">Privacy policy</a>
        <a class="link link-hover">Cookie policy</a>
      </nav>
      <form>
        <header class="footer-title text-[#61AC27]">Newsletter</header>
        <fieldset class="form-control w-80">
          <label class="label">
            <span class="label-text">Enter your email address</span>
          </label>
          <div class="relative">
            <input
              type="text"
              placeholder="username@site.com"
              class="input input-bordered w-full pr-16"
            />
            <button class="btn btn-primary absolute top-0 right-0 rounded-l-none">Subscribe</button>
          </div>
        </fieldset>
      </form>
    </footer>
    """
  end
end
