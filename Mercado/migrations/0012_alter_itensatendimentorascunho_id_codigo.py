# Generated by Django 4.0.4 on 2022-10-31 04:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Mercado', '0011_rename_data_atendimento_atendimento_data'),
    ]

    operations = [
        migrations.AlterField(
            model_name='itensatendimentorascunho',
            name='id_codigo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Mercado.produtosolidario'),
        ),
    ]
