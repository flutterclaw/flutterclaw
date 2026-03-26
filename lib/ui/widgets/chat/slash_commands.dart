/// Slash command definitions for the chat input autocomplete.
class SlashCommandDef {
  final String command;
  final String description;
  const SlashCommandDef(this.command, this.description);
}

const kSlashCommands = [
  SlashCommandDef('/help', 'Show available commands'),
  SlashCommandDef('/context', 'Context window usage breakdown'),
  SlashCommandDef('/status', 'Session info (model, tokens, cost)'),
  SlashCommandDef('/new', 'Start a new session'),
  SlashCommandDef('/reset', 'Reset the current session'),
  SlashCommandDef('/compact', 'Compress session context with AI summary'),
  SlashCommandDef('/model', 'View or switch model  /model [name]'),
  SlashCommandDef('/think', 'Set thinking level  off | low | medium | high'),
  SlashCommandDef('/verbose', 'Toggle verbose mode  on | off'),
  SlashCommandDef('/usage', 'Usage footer mode  off | tokens | full'),
  SlashCommandDef('/sh', 'Run command in Alpine sandbox  /sh <command>'),
];
