const venom = require('venom-bot');
const sequelize = require('./config/db');
const Contact = require('./models/Contact');

async function main() {
  // Verifica conexão com o banco
  try {
    await sequelize.authenticate();
    console.log('Conectado ao PostgreSQL.');
  } catch (err) {
    console.error('Erro ao conectar no banco:', err);
    return;
  }

  // Inicia sessão do WhatsApp
  venom
    .create({
      session: 'whatsapp-session',
    headless: true, // <- Modo com navegador visível
    useChrome: true, // <- Usa o Chrome instalado (não Chromium interno)

    })
    .then(async (client) => {
      console.log('WhatsApp conectado. Enviando mensagens...');

      const contacts = await Contact.findAll();

      for (let contact of contacts) {
        const number = contact.phone.replace(/\D/g, '') + '@c.us';
        try {
          await client.sendText(number, `Olá ${contact.name || ''}, esta é uma mensagem automática!`);
          console.log(`Mensagem enviada para ${contact.phone}`);
        } catch (err) {
          console.error(`Erro ao enviar para ${contact.phone}:`, err.message);
        }
      }

      console.log('Finalizado.');
    })
    .catch((error) => {
      console.error('Erro ao iniciar venom-bot:', error);
    });
}

main();
