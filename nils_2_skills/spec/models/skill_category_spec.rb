describe SkillCategory do
  it 'requires category_name' do
    expect(SkillCategory.new(category_name: nil)).to_not be_valid
  end

  it 'does not require description' do
    expect(SkillCategory.new(category_name: 'Test', description: nil)).to be_valid
  end

  it 'requires unique category_name' do
    SkillCategory.create(category_name: 'Test', description: 'Test')
    expect(SkillCategory.new(category_name: 'Test', description: 'Test')).to_not be_valid
  end
end
