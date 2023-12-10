// npm install mysql2 sequelize

const { Sequelize, DataTypes } = require('sequelize');

// Configuração da conexão com o banco de dados
const sequelize = new Sequelize(
    'MundoVirtual', // nome do seu banco de dados
    'root',
    'tatu,0609',
    {
        host: 'localhost',
        dialect: 'mysql',
    }
);

// Definição do modelo Cliente
const Cliente = sequelize.define('Cliente', {
    Nome: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    Email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
    Senha: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});

// Definição do modelo Tecnico
const Tecnico = sequelize.define('Tecnico', {
    Nome: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    Telefone: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    CPF: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
    Endereco: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    Email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
    Senha: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});

// Definição do modelo Agendamento
const Agendamento = sequelize.define('Agendamento', {
    DataHora: {
        type: DataTypes.DATE,
        allowNull: false,
    },
});

// Definição do modelo Localizacao
const Localizacao = sequelize.define('Localizacao', {
    CEP: {
        type: DataTypes.STRING,
    },
    Bairro: {
        type: DataTypes.STRING,
    },
});

// Definição do modelo PreAtendimento
const PreAtendimento = sequelize.define('PreAtendimento', {
    Problema: {
        type: DataTypes.STRING,
    },
    Valor: {
        type: DataTypes.DECIMAL(10, 2),
    },
});

// Definição do modelo Avaliacao
const Avaliacao = sequelize.define('Avaliacao', {
    Nota: {
        type: DataTypes.INTEGER,
    },
    Comentario: {
        type: DataTypes.TEXT,
    },
});

// Definição das relações entre os modelos
Cliente.hasMany(Agendamento);
Agendamento.belongsTo(Cliente);

Cliente.hasMany(Localizacao);
Localizacao.belongsTo(Cliente);

Cliente.hasMany(PreAtendimento);
PreAtendimento.belongsTo(Cliente);

Tecnico.hasMany(PreAtendimento);
PreAtendimento.belongsTo(Tecnico);

Cliente.hasMany(Avaliacao);
Avaliacao.belongsTo(Cliente);

Tecnico.hasMany(Avaliacao);
Avaliacao.belongsTo(Tecnico);

// Sincronizando os modelos com o banco de dados
sequelize.sync({ force: true }).then(async () => {
    // Seu código para criar e consultar dados aqui

    // Fechando a conexão com o banco de dados
    await sequelize.close();
});
