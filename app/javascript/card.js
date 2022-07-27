const pay = () => {
  
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {

    e.preventDefault();

    //フォームの情報を取得
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_form[number]"),
      exp_month: formData.get("purchase_form[exp_month]"),
      exp_year: `20${formData.get("purchase_form[exp_year]")}`,
      cvc: formData.get("purchase_form[cvc]"),
    };

    //トークンの値をフォームに含める
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      //クレジットカード情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      //フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
  });
};

//card.jsが読み込まれているか確認
window.addEventListener("load", pay);