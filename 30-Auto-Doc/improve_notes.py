#!/usr/bin/env python3
"""Script para melhorar notas do Obsidian com frontmatter, tags e secoes."""

import os
import re
from datetime import datetime

BASE_DIR = "."

def get_domain_tags(filename):
    """Determina tags de dominio baseadas no nome do arquivo."""
    filename_lower = filename.lower()
    
    domain_tags = []
    
    if any(k in filename_lower for k in ['news-ia', 'ia-', '-ia-', 'agentes', 'vibe-coding', 'claude', 'copilot', 'llm', 'ai-']):
        domain_tags.append('ai')
    
    if any(k in filename_lower for k in ['python', 'javascript', 'typescript', 'code', 'coding', 'dev', 'git', 'test', 'setup', 'vitest']):
        domain_tags.append('development')
    
    if any(k in filename_lower for k in ['openclaw', 'notebooklm', 'n8n', 'supabase', 'telegram', 'gateway', 'hermes', 'ares', 'workflow']):
        domain_tags.append('tools')
    
    if any(k in filename_lower for k in ['business', 'vender', 'agencia', 'marketing', 'growth', 'startup', 'saas', 'synkroo']):
        domain_tags.append('business')
    
    if any(k in filename_lower for k in ['sessao', 'sessao', 'session']):
        domain_tags.append('session')
    
    if any(k in filename_lower for k in ['knowledge', 'aprendizado', 'learning', 'guia', 'referencia']):
        domain_tags.append('knowledge')
    
    if any(k in filename_lower for k in ['cerebro', 'memoria', 'memory', 'segundo']):
        domain_tags.append('memory')
    
    if any(k in filename_lower for k in ['rico', 'finance', 'money', 'invest']):
        domain_tags.append('finance')
    
    if any(k in filename_lower for k in ['produtiv', 'automat', 'workflow']):
        domain_tags.append('productivity')
    
    if 'youtube' in filename_lower:
        domain_tags.append('youtube')
    
    if any(k in filename_lower for k in ['erro', 'error', 'bug', 'fix', 'issue', 'problema', 'solucao', 'solucao']):
        domain_tags.append('troubleshooting')
    
    if not domain_tags:
        domain_tags.append('knowledge')
    
    return domain_tags

def process_file(filepath):
    filename = os.path.basename(filepath)
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    lines = content.split('\n')
    modified = False
    
    has_frontmatter = content.startswith('---')
    
    if not has_frontmatter:
        domain_tags = get_domain_tags(filename)
        now = datetime.now().isoformat()
        
        frontmatter = '---\n'
        frontmatter += f'created: "{now}"\n'
        frontmatter += f'updated: "{now}"\n'
        frontmatter += 'tags: [auto-doc, hermes'
        for tag in domain_tags:
            frontmatter += f', {tag}'
        frontmatter += ']\n'
        frontmatter += 'type: knowledge\n'
        frontmatter += '---\n\n'
        
        content = frontmatter + content
        modified = True
    else:
        frontmatter_end = -1
        for i, line in enumerate(lines):
            if i > 0 and line.strip() == '---':
                frontmatter_end = i
                break
        
        if frontmatter_end > 0:
            frontmatter_lines = lines[1:frontmatter_end]
            needs_update = False
            
            for idx, line in enumerate(frontmatter_lines):
                if line.startswith('tags:'):
                    if 'auto-doc' not in line and 'auto_doc' not in line:
                        line = line.rstrip(']') + ', auto-doc]'
                        needs_update = True
                    if 'hermes' not in line:
                        line = line.rstrip(']') + ', hermes]'
                        needs_update = True
                    frontmatter_lines[idx] = line
            
            if needs_update:
                lines = frontmatter_lines + ['---'] + lines[frontmatter_end+1:]
                content = '\n'.join(lines)
                modified = True
    
    notas_patterns = ['Notas Relacionadas', '## @@', '## @@ Relacionado']
    has_notas = any(p in content for p in notas_patterns)
    
    if not has_notas:
        notas_section = '\n## @@ Notas Relacionadas\n\n-\n'
        if '---' in content:
            first_triple_dash = content.index('---')
            second_triple_dash = content.index('---', first_triple_dash + 3)
            insert_pos = second_triple_dash + 3
            content = content[:insert_pos] + notas_section + content[insert_pos:]
        else:
            content = notas_section + content
        modified = True
    
    if '@@ Tags' not in content and '## @@ Tags' not in content:
        domain_tags = get_domain_tags(filename)
        tags_section = '\n---\n\n## @@ Tags\n\n#auto-doc #hermes #' + domain_tags[0] + '\n'
        content = content.rstrip() + tags_section
        modified = True
    
    if modified:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

def main():
    files = [f for f in os.listdir(BASE_DIR) 
             if f.endswith('.md') and os.path.isfile(os.path.join(BASE_DIR, f))]
    
    improved = []
    for filename in files:
        filepath = os.path.join(BASE_DIR, filename)
        try:
            if process_file(filepath):
                improved.append(filename)
        except Exception as e:
            print(f"Erro em {filename}: {e}")
    
    print(f'\nMelhoradas {len(improved)} notas:')
    for f in improved:
        print(f'  - {f}')

if __name__ == '__main__':
    main()
