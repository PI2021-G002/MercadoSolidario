# Generated by Django 4.0.4 on 2024-04-22 02:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Mercado', '0016_alter_pessoasatendimento_options_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='atendimento',
            old_name='id_assitido',
            new_name='id_assistido',
        ),
        migrations.RenameField(
            model_name='atendimentorascunho',
            old_name='assitido',
            new_name='assistido',
        ),
        migrations.RenameField(
            model_name='atendimentorascunho',
            old_name='id_assitido',
            new_name='id_assistido',
        ),
    ]